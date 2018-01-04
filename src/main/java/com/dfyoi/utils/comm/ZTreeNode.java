package com.dfyoi.utils.comm;

import java.io.Serializable;
import java.util.List;

public class ZTreeNode implements Serializable {
	private static final long serialVersionUID = 1L;
    private String name;  
    private String sym;  
    public String getSym() {
		return sym;
	}

	public void setSym(String sym) {
		this.sym = sym;
	}

	private boolean open;  //是否默认打开  
    private boolean nocheck; //是否可以选  
    private boolean checked; //是否默认选上  
    private List<ZTreeNode> children;
      
    public ZTreeNode() {  
        super();  
    }  
  
    public ZTreeNode(String name, boolean open, boolean nocheck, boolean checked) {  
        super();   
        this.name = name;  
        this.open = open;  
        this.nocheck = nocheck;  
        this.checked = checked;  
    }  
  
    public String getName() {  
        return name;  
    }  
  
    public void setName(String name) {  
        this.name = name;  
    }  
  
    public boolean isOpen() {  
        return open;  
    }  
  
    public void setOpen(boolean open) {  
        this.open = open;  
    }  
  
    public boolean isChecked() {  
        return checked;  
    }  
  
    public void setChecked(boolean checked) {  
        this.checked = checked;  
    }  
  
    public boolean isNocheck() {  
        return nocheck;  
    }  
  
    public void setNocheck(boolean nocheck) {  
        this.nocheck = nocheck;  
    }

	public List<ZTreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<ZTreeNode> children) {
		this.children = children;
	}  
}
