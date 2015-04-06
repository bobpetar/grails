package com.retouch

class Comment {
    String message
    Date createdOn = new Date()
    String role
    User user

    static belongsTo = [task:Task]
    static constraints = {
        message(nullable:false, blank:false, maxSize: 1000)
    }

}
