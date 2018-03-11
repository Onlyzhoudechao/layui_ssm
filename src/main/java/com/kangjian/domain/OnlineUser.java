package com.kangjian.domain;

public class OnlineUser {
    private String id;

    private String userId;

    private String loginTime;

    private String loginIp;

    private String tempVar1;

    private String tempVar2;

    private String tempVar3;

    private String tempVar4;

    private String tempVar5;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime == null ? null : loginTime.trim();
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
    }

    public String getTempVar1() {
        return tempVar1;
    }

    public void setTempVar1(String tempVar1) {
        this.tempVar1 = tempVar1 == null ? null : tempVar1.trim();
    }

    public String getTempVar2() {
        return tempVar2;
    }

    public void setTempVar2(String tempVar2) {
        this.tempVar2 = tempVar2 == null ? null : tempVar2.trim();
    }

    public String getTempVar3() {
        return tempVar3;
    }

    public void setTempVar3(String tempVar3) {
        this.tempVar3 = tempVar3 == null ? null : tempVar3.trim();
    }

    public String getTempVar4() {
        return tempVar4;
    }

    public void setTempVar4(String tempVar4) {
        this.tempVar4 = tempVar4 == null ? null : tempVar4.trim();
    }

    public String getTempVar5() {
        return tempVar5;
    }

    public void setTempVar5(String tempVar5) {
        this.tempVar5 = tempVar5 == null ? null : tempVar5.trim();
    }
}