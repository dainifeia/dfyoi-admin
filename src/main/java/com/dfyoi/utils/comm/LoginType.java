package com.dfyoi.utils.comm;

public enum LoginType {
	ADMIN("Admin"),  FRONT("Front");

    private String type;

    private LoginType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return this.type.toString();
    }
}
