package com.etc.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.MDC;

public class ResFilter implements Filter {

    public void destroy() {  
    }  
  
    public void doFilter(ServletRequest request, ServletResponse response,  
           FilterChain chain) throws IOException, ServletException {  
       HttpServletRequest req=(HttpServletRequest)request;  
        HttpSession session= req.getSession(); 
        //MDC.put("e_id","1"); 
        chain.doFilter(request, response); 
    
        
        
        
    }  
    public void init(FilterConfig Config) throws ServletException {  
//     this.filterConfig = Config;  
//     String ccc = Config.getServletContext().getInitParameter("cherset");  
//     this.targetEncoding = Config.getInitParameter("cherset");  
  
    }  

}
