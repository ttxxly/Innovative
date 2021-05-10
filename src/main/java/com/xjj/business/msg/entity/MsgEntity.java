/****************************************************
 * Description: Entity for t_bis_msg
 * Copyright:   Copyright (c) 2021
 * Company:     xjj
 * @author      zhanghejie
 * @version     1.0
 * @see
	HISTORY
    *  2021-05-10 zhanghejie Create File
**************************************************/

package com.xjj.business.msg.entity;

import java.util.Date;
import com.xjj.framework.entity.EntitySupport;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MsgEntity extends EntitySupport {

    private static final long serialVersionUID = 1L;
    public MsgEntity(){}
    private String sender;//发送人
    private String msg;//消息内容
    private Date sendtime;//发送时间
    private String receiver;//接受者
    /**
     * 返回发送人
     * @return 发送人
     */
    public String getSender() {
        return sender;
    }
    
    /**
     * 设置发送人
     * @param sender 发送人
     */
    public void setSender(String sender) {
        this.sender = sender;
    }
    
    /**
     * 返回消息内容
     * @return 消息内容
     */
    public String getMsg() {
        return msg;
    }
    
    /**
     * 设置消息内容
     * @param msg 消息内容
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    /**
     * 返回发送时间
     * @return 发送时间
     */
    public Date getSendtime() {
        return sendtime;
    }
    
    /**
     * 设置发送时间
     * @param sendtime 发送时间
     */
    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }
    
    /**
     * 返回接受者
     * @return 接受者
     */
    public String getReceiver() {
        return receiver;
    }
    
    /**
     * 设置接受者
     * @param receiver 接受者
     */
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }
    

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.SIMPLE_STYLE).append("com.xjj.business.msg.entity.MsgEntity").append("ID="+this.getId()).toString();
    }
}

