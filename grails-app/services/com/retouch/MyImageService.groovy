package com.retouch

import com.codeharmony.Jdcraw
import net.sf.ij_plugins.dcraw.DCRawReader

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

class MyImageService {

    def grailsApplication
    def springSecurityService
    def burningImageService

    public void deleteImage( String imageName, String imageUploadPath){
        try{
            if(imageName && imageName!=""){
                def String productImagePath = imageUploadPath+imageName
                println("Image Path" + productImagePath)
                File imageFile = new File(productImagePath)
                imageFile.delete()
            }
        }catch(e){
            println e
        }
    }

    /*  public String saveImage(imageFile){
     def date = new Date()
     def Random randomGenerator = new Random()
     def String fileNamePrefix = date.time.toString()+"_"+ randomGenerator.nextInt(1000000);
     def String fileName = fileNamePrefix+ ".jpg";
     // def root = request.getSession().getServletContext().getRealPath("/")
     def String productImagePath = grailsApplication.config.retouch.imageUploadPath+fileName
     def File uploadedImage = new File(productImagePath)
     println productImagePath
     imageFile.transferTo(uploadedImage) //Writing Original File
     return fileName
     }*/
    public void deleteImagePackage(ReImage imageDomain){
        String imageUploadPath = grailsApplication.config.retouch.imageUploadPath
        deleteImage( imageDomain.getLargeImageName(), imageUploadPath)
        deleteImage( imageDomain.getWaterMarkedImageName(), imageUploadPath)
        deleteImage( imageDomain.getThumbnailImageName(), imageUploadPath)
        deleteImage( imageDomain.getImagePath(), imageUploadPath)
    }

    public void deleteTechniqueImage(Technique techniqueInstance){
        String techniqueImageUploadPath = grailsApplication.config.retouch.techniqueImageUploadPath
        deleteImage(techniqueInstance.getLargeImageName(), techniqueImageUploadPath)
        deleteImage(techniqueInstance.getThumbnailImageName(), techniqueImageUploadPath)
        deleteImage(techniqueInstance.getBeforeafterimage(), techniqueImageUploadPath)
    }

    public void deleteTestimonialImage(Testimonial testimonialInstance){
        try{
            println("Inside deleteTestimonialImage")
            String techniqueImageUploadPath = grailsApplication.config.retouch.techniqueImageUploadPath
            println("testimonial Image " + techniqueImageUploadPath)
            deleteImage(testimonialInstance?.getLargeImageName(), techniqueImageUploadPath)
            deleteImage(testimonialInstance?.getThumbnailImageName(), techniqueImageUploadPath)
            deleteImage(testimonialInstance?.getPhoto(), techniqueImageUploadPath)
        }
        catch (Exception e){
            println("Testimonial Image deletion problem.")
            return
        }
    }

    public String convertRawToTIff(imageFile, destinationPath){
       Jdcraw converter = new Jdcraw();
        return converter.convertRawToTIff(imageFile,destinationPath);
    }

    public String convertRawToJPEG(File imageFile,String destinationPath){
       // convertRawToTIff(imageFile, destinationPath)
        //File file = new File("DSC1234.NEF");
        println "TESTING IMAGE CONVERSIONS"+destinationPath
        BufferedImage image = ImageIO.read(imageFile);
        ImageIO.write(image, "jpg", new File(destinationPath));



        return destinationPath
    }


    public String saveImagePackage(imageFile){
        def date = new Date()
        def Random randomGenerator = new Random()
        def String fileNamePrefix = date.time.toString()+"_"+ randomGenerator.nextInt(1000000);
        def String userId  = ((User)springSecurityService.getCurrentUser())?.getId()
        def String fileNameNoExt = userId+"_"+fileNamePrefix
        String ext =  getFileExtension(imageFile.originalFilename);
        if(ext.toLowerCase()=='.jpeg'){
            ext = ".jpg"
        }
        String fileName = fileNameNoExt+ext.toLowerCase()
        String fileNameLarge = fileNameNoExt+"_L"
        String fileNameLargeWithWatermark = fileNameNoExt+"33"
        String fileNameThumb = fileNameNoExt+"_T"

        def String productImagePath = grailsApplication.config.retouch.imageUploadPath+fileName
        def orginalFileName

        //Write Original File
        def File uploadedImage = new File(productImagePath)
        println productImagePath
        imageFile.transferTo(uploadedImage) //Writing Original File

        println ext.toLowerCase()
        if(ext.toLowerCase()!='.jpg'  && ext.toLowerCase()!='.jpeg' ){
            productImagePath = convertRawToJPEG(uploadedImage,grailsApplication.config.retouch.imageUploadPath+fileNameNoExt+".jpg")
        }
        println "FILE NAME LARGE " + fileNameLarge
        burningImageService.doWith(productImagePath, grailsApplication.config.retouch.imageUploadPath).execute (fileNameLarge, {
            it.scaleApproximate(800, 800)
        }).execute (fileNameLargeWithWatermark, {
            it.scaleApproximate(800, 800)
            orginalFileName = it.watermark(grailsApplication.mainContext.servletContext.getRealPath('/images/logo.png'))
        })
                .execute (fileNameThumb, {
            it.scaleApproximate(400, 400)
        })




        return fileName
    }

    private static String getFileExtension(String fileName) {
        int lastIndexOf = fileName.lastIndexOf(".");
        if (lastIndexOf == -1) {
            return ""; // empty extension
        }
        return fileName.substring(lastIndexOf);
    }

    public String saveTechniqueImage(imageFile){
        def date = new Date()
        def Random randomGenerator = new Random()
        def String fileNamePrefix = date.time.toString()+"_"+ randomGenerator.nextInt(1000000)
        def String userId  = ((User)springSecurityService.getCurrentUser())?.getId()
        def String fileNameNoExt = userId + "_" + fileNamePrefix
        String ext =  getFileExtension(imageFile.originalFilename);
        String fileName = fileNameNoExt+ext.toLowerCase()
        String fileNameLarge = fileNameNoExt+"_L"
        String fileNameThumb = fileNameNoExt+"_T"

        def String productImagePath = grailsApplication.config.retouch.techniqueImageUploadPath+fileName

        burningImageService.doWith(imageFile, grailsApplication.config.retouch.techniqueImageUploadPath).execute (fileNameLarge, {
            it.scaleApproximate(447, 447)
        })
                .execute (fileNameThumb, {
            it.scaleApproximate(335, 335)
        })


        //Write Original File
        def File uploadedImage = new File(productImagePath)
        println productImagePath
        imageFile.transferTo(uploadedImage) //Writing Original File

        return fileName
    }

    /*    public String resizeImage(File imageFile){
     // File image = new File("myimage.png");
     //  File smallImage = new File("myimage_s.png"); // FORNOW: added the file extension just to check the result a bit more easily
     // FORNOW: added print statements just to be doubly sure where we're reading from and writing to
     def date = new Date()
     def Random randomGenerator = new Random()
     def String fileNamePrefix = date.time.toString()+"_"+ randomGenerator.nextInt(1000000);
     def String fileName = fileNamePrefix+ ".jpg";
     def String productImagePath = grailsApplication.config.sweetspot.imageUploadPath+fileName
     def File uploadedImage = new File(productImagePath)
     System.out.println(imageFile.getAbsolutePath());
     try {
     BufferedImage bufimage = ImageIO.read(imageFile);
     BufferedImage bISmallImage = Scalr.resize(bufimage, 30); // after this line my dimensions in bISmallImage are correct!
     ImageIO.write(bISmallImage, "jpg", uploadedImage); // but my smallImage has the same dimension as the original foto
     } catch (Exception e) {
     System.out.println(e.getMessage()); // FORNOW: added just to be sure
     }
     }*/
}
