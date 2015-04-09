package com.retouch

class Testimonial {

    String fullName
    String customerPosition
    String testimonial
    String userType
    String photo

    def myImageService

    static constraints = {
        fullName(blank: false, nullable: false)
        customerPosition(blank: true, nullable: true)
        testimonial(blank: false, nullable: false, maxSize: 1000)
        userType(blank: false, nullable: false, inList: ["Retoucher", "Customer"])
        photo(blank: true, nullable: true)
    }

    String toString(){
        return photo
    }

    String getLargeImageName(){
        return getSubName(photo,"_L")
    }

    String getThumbnailImageName(){
        return getSubName(photo,"_T")
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
        myImageService.deleteTestimonialImage(this)
    }
}
