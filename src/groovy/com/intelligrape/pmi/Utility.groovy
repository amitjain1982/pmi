package com.intelligrape.pmi


class Utility {
    public static final String getCustomPropertyValue(RequestToken requestToken, String name) {
        String value = null
        CustomPropertyValue customPropertyValue = requestToken.customPropertyValues.find { CustomPropertyValue it ->
            it.name.equalsIgnoreCase(name)
        }
        return customPropertyValue?.value
    }
}
