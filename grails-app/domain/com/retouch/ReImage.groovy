package com.retouch

class ReImage {

    String imagePath
    def myImageService

    static belongsTo = [task:Task, technique:Technique]

    static constraints = {
        imagePath(nullable: false, blank:false)
		technique(nullable:true, blank:true)
    }

    String toString(){
        return imagePath
    }

    String getLargeImageName(){
       return getSubName(imagePath,"_L")
    }

    String getWaterMarkedImageName(){
        return getSubName(imagePath,"33")
    }

    String getThumbnailImageName(){
        return getSubName(imagePath,"_T")
    }

     static String getSubName(String fullFileName,subSuffix){
         int lastIndexOf = fullFileName.lastIndexOf(".");
         def part = subSuffix
         if (lastIndexOf == -1) {
             return fullFileName + part; // empty extension
         }
         return  fullFileName.substring(0,lastIndexOf) + part + ".jpg";
    }

    def beforeDelete() {
        myImageService.deleteImagePackage(this)
    }

}
