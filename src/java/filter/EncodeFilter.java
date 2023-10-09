package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodeFilter implements Filter{
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.print("过滤器初始化-------");
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		chain.doFilter(request, response);
	}
	@Override
	public void destroy() {
		System.out.print("过滤器销毁-------");
		
	}
}
