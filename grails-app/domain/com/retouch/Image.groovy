package com.retouch

class Image {

    String imagePath

    static constraints = {
        imagePath(nullable: false, blank:false)
    }

    String toString(){
        return imagePath
    }


}
