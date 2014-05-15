package com.intelligrape.pmi


class Project {

    String name
    String description
    Vertical vertical
    Date dateCreated
    Date lastUpdated

    static hasMany = [collaborators: Collabortaor]

    static constraints = {
        name(unique: true)

    }


}
