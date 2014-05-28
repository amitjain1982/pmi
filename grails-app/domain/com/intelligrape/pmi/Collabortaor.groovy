package com.intelligrape.pmi


class Collabortaor {

    String name
    String email
    Boolean isProjectOwner
    Date dateCreated
    Date lastUpdated

    static belongsTo = [project: Project]


    static constraints = {
        email(email: true,unique: 'name')

    }


}
