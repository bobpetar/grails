package com.retouch

class ReImage {

    String imagePath

    static constraints = {
        imagePath(nullable: false, blank:false)
    }

    String toString(){
        return imagePath
    }


}
