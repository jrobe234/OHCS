package com.struts2.demo.action;
 
import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;
 
public class HelloWorldAction extends ActionSupport {
 
 
    private String message;
 
    private Date nowDate;
 
    @Override
    public void validate(){
        if (message==null || message.length()==0)
            addActionError(getText("error.enter.message"));
    }
 
    @Override
    public String execute() throws Exception {
        nowDate = new Date();
 
        return SUCCESS;
    }
 
    public String getMessage() {
        return message;
    }
 
    public void setMessage(String message) {
        this.message = message;
    }
 
    public Date getNowDate() {
        return nowDate;
    }
 
}