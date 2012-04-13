<%-- 
    Document   : confirm_payment
    Created on : 2012-3-19, 16:27:01
    Author     : Ben <arkilis@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Payment Page</title>
    </head>
    <body>
        <h1>Confirm your payment</h1>

        <table>
            <tr>
                <td>$30</td>
                <td>
                    <form name="paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">   
                        <input type="hidden" name="cmd" value="_xclick" />   
                        <input type="hidden" name="business" value="mmww_1331724436_biz@gmail.com" /><!--这里填写你的paypal账户email-->   
                        <input type="hidden" name="item_name" value="order information" /><!--这里填写客户订单的一些相关信息，当客户连到paypal网站付款的时候将看到这些信息-->   
                        <input type="hidden" name="amount" value="30.00" /><!--订单的总金额信息-->   
                        <input type="hidden" name="currency_code" value="AUD" /><!--订单总金额对应的货币类型,客户可以用其他币种来付款,比如这里订单币种是美元USD,客户可以用欧元EUR来付款,由paypal根据当前汇率自动实现币种之间的换算-->      
                        <input type="hidden" name="on0" value="customerId" /><!-- 自定义的参数1 -->   
                        <input type="hidden" name="os0" value="stephen" /><!-- 对应上面自定义参数1对应的值 -->   
                        <input type="hidden" name="on1" value="address" /><!-- 自定义的参数2 -->   
                        <input type="hidden" name="os1" value="shanghai china" /><!-- 对应上面自定义参数2对应的值 -->
                        <!--这里告诉paypal付款的通信url,即当客户付款后调用这个url通知系统, 这个是不可能的地址，Paypal服务器根本找不到！-->
                        <input type="hidden" name="return" id="notify_url" value="http://localhost:9000/OnlineHealthCareSystem/success.jsp" /> 
                        <input name="Paypal" type="button" value="Pay Now!" onclick="javaScript:this.form.submit();"></td>   
                    </form>
                </td>
                <td></td>
            </tr>
        </table>
    </body>
</html>
