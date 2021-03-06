makeLinearPoolPlot <-
function(fit, xl, xu, d = "best", w = 1, lwd, xlab, ylab, 
         legend_full = TRUE, ql = NULL, qu = NULL, 
         nx = 200, addquantile = FALSE, fs = 12){
	
  expert <- ftype <- NULL # hack to avoid R CMD check NOTE
  
	n.experts <- nrow(fit$vals)
	
	if(n.experts < 27){
	  expertnames <- LETTERS[1:n.experts]
	}
	
	if(n.experts > 26){
	  expertnames <- 1:n.experts
	}
	
	nxTotal <- nx + length(c(ql, qu))
	
	x <- matrix(0, nxTotal, n.experts)
	fx <- x
  if(min(w)<0 | max(w)<=0){stop("expert weights must be non-negative, and at least one weight must be greater than 0.")}
  
	if(length(w)==1){
	  w <- rep(w, n.experts)
	}
  
	weight <- matrix(w/sum(w), nxTotal, n.experts, byrow = T)
 
	for(i in 1:n.experts){
		densitydata <- expertdensity(fit, d, ex = i, xl, xu, ql, qu, nx)
		x[, i] <- densitydata$x
		fx[, i] <-densitydata$fx 
	}
	
	fx.lp <- apply(fx * weight, 1, sum)
	
	df1 <- data.frame(x = rep(x[, 1], n.experts + 1),
	                  fx = c(as.numeric(fx), fx.lp),
	                  expert = c(rep(expertnames, each =nxTotal),
	                             rep("linear pool", nxTotal)),
	                  ftype = c(rep("individual", nxTotal * n.experts), 
	                           rep("linear pool", nxTotal)))
	df1$expert <- factor(df1$expert, levels = c(expertnames, "linear pool"))
	
	if(legend_full){
	  p1 <- ggplot(df1, aes(x = x, y = fx, 
	                        colour = expert, 
	                        linetype = expert, 
	                        size = expert)) +
	    scale_linetype_manual(values = c(rep("dashed", n.experts), "solid")) +
	    scale_size_manual(values = lwd * c(rep(0.5, n.experts), 1.5))}else{
	      p1 <- ggplot(df1, aes(x = x, y = fx, 
	                            colour =  ftype, 
	                            linetype=ftype, size =ftype)) +
	        scale_linetype_manual(name = "distribution", values = c("dashed", "solid"))+
	        scale_size_manual(name = "distribution", values = lwd * c(.5, 1.5)) +
	        scale_color_manual(name = "distribution", values = c("black", "red"))
	    }
	
	if(d == "hist"){
	  p1 <- p1 + geom_step(aes(group = expert))
	}else{
	  p1 <- p1 + geom_line(aes(group = expert))
	}
	 p1 <- p1 + labs(x = xlab, y = ylab)
	
	if((!is.null(ql)) & (!is.null(qu)) & addquantile){
	  if(legend_full){
	    ribbon_col <- scales::hue_pal()(n.experts + 1)[n.experts + 1]}else{
	      ribbon_col <- "red"
	    }
	  p1 <- p1 + geom_ribbon(data = with(df1, subset(df1, x <= ql  &expert == "linear pool")),
	                         aes(ymax = fx, ymin = 0),
	                         alpha = 0.2, show.legend = FALSE, colour = NA, fill =ribbon_col ) +
	    geom_ribbon(data = with(df1, subset(df1, x >=qu  &expert == "linear pool")),
	                aes(ymax = fx, ymin = 0),
	                alpha = 0.2, show.legend = FALSE, colour = NA, fill =ribbon_col )
	    
	  
	}    
	p1 + theme(text = element_text(size = fs))
}
