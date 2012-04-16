/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.account;

import com.opensymphony.xwork2.ActionSupport;  
import com.opensymphony.xwork2.ActionContext;  
import java.util.*;
/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class LogoutAction_1 extends ActionSupport {

    public LogoutAction_1() {
    }

    @Override
    public String execute() throws Exception {


        Map session = ActionContext.getContext().getSession();
        session.remove("email");
        return SUCCESS;
    }
}
