package fa.training.employeemanagement.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PagingTag extends SimpleTagSupport {


    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    private HttpServletRequest request;

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        try {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("?").append(request.getQueryString());
            if (request.getAttribute("keyword") != null && request.getAttribute("type") != null) {
                stringBuilder.append("&keyword=").append((String) request.getAttribute("keyword"));
                stringBuilder.append("&type=").append((String) request.getAttribute("type"));
            }
            out.print(stringBuilder.toString());
            JspFragment f = getJspBody();
            if (f != null) {
                f.invoke(out);
            }
        } catch (java.io.IOException ex) {
            throw new JspException("Error in ImportUrlTag tag", ex);
        }
    }
}
