package com.atguigu.crud.bean;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.jdbc.support.nativejdbc.OracleJdbc4NativeJdbcExtractor;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * 此类将pageInfo的返回结果封装并返回
 */
public class Msg {
//    状态码 100成功，200失败
    private int code;
//    提示信息
    private String msg;
//    用户返回给浏览器的数据
    private Map<String, Object>  extend=new HashMap();

    public static Msg success(){
        Msg msg= new Msg(){};
        msg.setCode(100);
        msg.setMsg("处理成功");
        return msg;
    }
    public static Msg fail(){
        Msg msg= new Msg(){};
        msg.setCode(200);
        msg.setMsg("处理失败");
        return msg;
    }
//    帮助链式操作
    public Msg add(String key,Object value){
         this.getExtend().put(key,value);
         return this;
    }


    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", extend=" + extend +
                '}';
    }
}

