package com.intelligrape.pmi


class Vertical {
    String name
    Date dateCreated
    Date lastUpdated

    static constraints = { name(unique: true) }

}
