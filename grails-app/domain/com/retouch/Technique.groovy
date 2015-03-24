package com.retouch

class Technique {
    String name
    String description
    String groep
	String beforeafterimage
    Double ratePerTechnique

    def myImageService

    static constraints = {
        name(unique:true,nullable:false,blank:false)
        description(nullable:false,blank:false, maxSize: 1000)
        groep(nullable:true,blank:true, matches: "[a-zA-Z]+")
		beforeafterimage(nullable:false, blank:false)
        ratePerTechnique(nullable: true, blank:true)
    }

    String toString(){
        return beforeafterimage
    }

    String getLargeImageName(){
        return getSubName(beforeafterimage,"_L")
    }

    String getThumbnailImageName(){
        return getSubName(beforeafterimage,"_T")
    }

    static String getSubName(String fullFileName,subSuffix){
        int lastIndexOf = fullFileName?.lastIndexOf(".");
        def part = subSuffix
        if (lastIndexOf == -1) {
            return fullFileName + part; // empty extension
        }
        return  fullFileName.substring(0,lastIndexOf) + part + fullFileName.substring(lastIndexOf);
    }

    def beforeDelete() {
        myImageService.deleteTechniqueImage(this)
    }
}
