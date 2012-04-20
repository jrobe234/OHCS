/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.csse3005gf.ohcs.consultation;

import org.csse3005gf.ohcs.hibernate.ConsultOperate;
import org.csse3005gf.ohcs.hibernate.Consultation;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Ben <arkilis@gmail.com>
 */
public class ShowChatLogAction_1 extends ActionSupport{
    
    
    private ArrayList<Consultation> arr_Con;
            
            
    /**
     * 
     * @return
     * @throws Exception 
     */
    @Override
    public String execute() throws Exception {
        
        ConsultOperate co= new ConsultOperate ();
        
        String szPi= ServletActionContext.getRequest().getParameter("patientid");
        
        int pid= Integer.parseInt(szPi);
       
        setArr_Con(co.getArrayCognsult(pid));
        
        
        return SUCCESS;
        
    }

    public ArrayList<Consultation> getArr_Con() {
        return arr_Con;
    }

    public void setArr_Con(ArrayList<Consultation> arr_Con) {
        this.arr_Con = arr_Con;
    }
    
    
    
}
