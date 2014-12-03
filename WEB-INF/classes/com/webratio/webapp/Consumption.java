package com.webratio.webapp;

public class Consumption implements java.io.Serializable {
    /** Serial version identifier. */
    private static final long serialVersionUID = 1L;

    private java.lang.Integer _oid;

    private java.sql.Timestamp _timestamp;

    private java.math.BigDecimal _quantity;

    private java.lang.String _user;

    private com.webratio.webapp.User _consumptionToUser;

    private float _searchScore;

    public java.lang.Integer getOid() {
        return _oid;
    }

    public void setOid(java.lang.Integer _oid) {
        this._oid = _oid;
    }

    public java.sql.Timestamp getTimestamp() {
        return _timestamp;
    }

    public void setTimestamp(java.sql.Timestamp _timestamp) {
        this._timestamp = _timestamp;
    }

    public java.math.BigDecimal getQuantity() {
        return _quantity;
    }

    public void setQuantity(java.math.BigDecimal _quantity) {
        this._quantity = _quantity;
    }

    public java.lang.String getUser() {
        if (_user != null) {
            return _user;
        }
        java.lang.Object role2Object = this.getConsumptionToUser();
        if (role2Object != null) {
            com.webratio.webapp.User role2 = role2Object instanceof java.util.Set ? (((java.util.Set) role2Object).isEmpty() ? null
                    : (com.webratio.webapp.User) ((java.util.Set) role2Object).iterator().next())
                    : (com.webratio.webapp.User) role2Object;
            if (role2 != null) {
                return role2.getUserName();
            }
        }
        return _user;
    }

    public void setUser(java.lang.String _user) {
        this._user = _user;
    }

    public com.webratio.webapp.User getConsumptionToUser() {
        return _consumptionToUser;
    }

    public void setConsumptionToUser(com.webratio.webapp.User _consumptionToUser) {
        this._consumptionToUser = _consumptionToUser;
    }

    public float getSearchScore() {
        return _searchScore;
    }

    public void setSearchScore(float _searchScore) {
        this._searchScore = _searchScore;
    }

    public String toString() {
        java.lang.StringBuffer sb = new java.lang.StringBuffer();
        sb.append(super.toString());
        int n = sb.length() - 1;
        if (sb.charAt(n) == ']') {
            sb.setCharAt(n, ',');
        } else {
            sb.append('[');
        }
        if (_oid != null)
            sb.append("oid=" + _oid + ',');
        if (_timestamp != null)
            sb.append("timestamp=" + _timestamp + ',');
        if (_quantity != null)
            sb.append("quantity=" + _quantity + ',');
        if (_user != null)
            sb.append("user=" + _user + ',');
        n = sb.length() - 1;
        if (sb.charAt(n) == ',') {
            sb.setCharAt(n, ']');
        } else if (sb.charAt(n) == '[') {
            sb.deleteCharAt(n);
        }
        return sb.toString();
    }

    public boolean equals(java.lang.Object obj) {
        if (!(obj instanceof com.webratio.webapp.Consumption)) {
            return false;
        }
        com.webratio.webapp.Consumption __other = (com.webratio.webapp.Consumption) obj;
        java.lang.Object key = null;
        java.lang.Object otherKey = null;
        key = this.getOid();
        otherKey = __other.getOid();
        if (key == null) {
            if (otherKey != null) {
                return false;
            }
        } else {
            if (otherKey == null) {
                return false;
            } else if (!key.equals(otherKey)) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        int hashCode = 0;
        java.lang.Object key = null;
        key = this.getOid();
        if (key != null) {
            hashCode |= key.hashCode();
        }
        return hashCode;
    }
}
