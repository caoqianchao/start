package org.cqc.web.controller;

/**
 * @author caoqc
 * @Description:
 * @date 2019/8/16 10:41
 */
public class Logic {

    private String A1;
    private String A2;
    private String B1;

    public Logic(String A1, String A2, String B1) {
        this.A1 = A1;
        this.A2 = A2;
        this.B1 = B1;
    }

    public boolean isPass(int mType) {
        switch (mType) {
            case 1:
                return (null != A1 && null != A2);
            case 2:
                return (null != B1);
            case 3:
                return (null != A1 && null != A2 && null != B1);
        }
        return Boolean.FALSE;
    }

    public String notPassPre(int mType) {
        switch (mType) {
            case 1:
                return "A1 或 A2 不能为空";
            case 2:
                return "B1 不能为空";
            case 3:
                return "A1 、A2 、B1不能为空";
        }
        return "";
    }

}

