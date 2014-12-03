package com.webratio.webapp;

public class User implements java.io.Serializable {
    /** Serial version identifier. */
    private static final long serialVersionUID = 1L;

    private java.lang.Integer _oid;

    private java.lang.String _userName;

    private java.lang.String _password;

    private java.lang.String _email;

    private java.lang.String _address;

    private java.lang.String _city;

    private java.lang.String _country;

    private java.math.BigDecimal _latitude;

    private java.math.BigDecimal _longitude;

    private java.util.Set _groups = new java.util.HashSet();

    private com.webratio.webapp.Group _defaultGroup;

    private java.util.Set _userToConsumption = new java.util.HashSet();

    private float _searchScore;

    public java.lang.Integer getOid() {
        return _oid;
    }

    public void setOid(java.lang.Integer _oid) {
        this._oid = _oid;
    }

    public java.lang.String getUserName() {
        return _userName;
    }

    public void setUserName(java.lang.String _userName) {
        this._userName = _userName;
    }

    public java.lang.String getPassword() {
        return _password;
    }

    public void setPassword(java.lang.String _password) {
        this._password = _password;
    }

    public java.lang.String getEmail() {
        return _email;
    }

    public void setEmail(java.lang.String _email) {
        this._email = _email;
    }

    public java.lang.String getAddress() {
        return _address;
    }

    public void setAddress(java.lang.String _address) {
        this._address = _address;
    }

    public java.lang.String getCity() {
        return _city;
    }

    public void setCity(java.lang.String _city) {
        this._city = _city;
    }

    public java.lang.String getCountry() {
        return _country;
    }

    public void setCountry(java.lang.String _country) {
        this._country = _country;
    }

    public java.math.BigDecimal getLatitude() {
        return _latitude;
    }

    public void setLatitude(java.math.BigDecimal _latitude) {
        this._latitude = _latitude;
    }

    public java.math.BigDecimal getLongitude() {
        return _longitude;
    }

    public void setLongitude(java.math.BigDecimal _longitude) {
        this._longitude = _longitude;
    }

    public java.util.Set getGroups() {
        return _groups;
    }

    public void setGroups(java.util.Set _groups) {
        this._groups = _groups;
    }

    public com.webratio.webapp.Group getDefaultGroup() {
        return _defaultGroup;
    }

    public void setDefaultGroup(com.webratio.webapp.Group _defaultGroup) {
        this._defaultGroup = _defaultGroup;
    }

    public java.util.Set getUserToConsumption() {
        return _userToConsumption;
    }

    public void setUserToConsumption(java.util.Set _userToConsumption) {
        this._userToConsumption = _userToConsumption;
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
        if (_userName != null)
            sb.append("userName=" + _userName + ',');
        if (_password != null)
            sb.append("password=" + _password + ',');
        if (_email != null)
            sb.append("email=" + _email + ',');
        if (_address != null)
            sb.append("address=" + _address + ',');
        if (_city != null)
            sb.append("city=" + _city + ',');
        if (_country != null)
            sb.append("country=" + _country + ',');
        if (_latitude != null)
            sb.append("latitude=" + _latitude + ',');
        if (_longitude != null)
            sb.append("longitude=" + _longitude + ',');
        n = sb.length() - 1;
        if (sb.charAt(n) == ',') {
            sb.setCharAt(n, ']');
        } else if (sb.charAt(n) == '[') {
            sb.deleteCharAt(n);
        }
        return sb.toString();
    }

    public boolean equals(java.lang.Object obj) {
        if (!(obj instanceof com.webratio.webapp.User)) {
            return false;
        }
        com.webratio.webapp.User __other = (com.webratio.webapp.User) obj;
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
