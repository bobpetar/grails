package com.retouch

import org.imgscalr.Scalr
import org.springframework.web.multipart.commons.CommonsMultipartFile

/*import javax.imageio.ImageIO
import java.awt.image.BufferedImage*/

class MyImageService {

    def grailsApplication
    def springSecurityService
    def burningImageService

    public void deleteImage( String imageName){
        try{
            if(imageName && imageName!=""){
                def String productImagePath = grailsApplication.config.retouch.imageUploadPath+imageName
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
        deleteImage( imageDomain.getLargeImageName())
        deleteImage( imageDomain.getThumbnailImageName())
        deleteImage( imageDomain.getImagePath())
        imageDomain.delete(flush: true)
    }


    public String saveImagePackage(imageFile){
        def date = new Date()
        def Random randomGenerator = new Random()
        def String fileNamePrefix = date.time.toString()+"_"+ randomGenerator.nextInt(1000000);
        def String userId  = ((User)springSecurityService.getCurrentUser())?.getId()
        def String fileNameNoExt = userId+"_"+fileNamePrefix
        String ext =  getFileExtension(imageFile.originalFilename);
        String fileName = fileNameNoExt+ext
        String fileNameLarge = fileNameNoExt+"_L"
        String fileNameThumb = fileNameNoExt+"_T"

        def String productImagePath = grailsApplication.config.retouch.imageUploadPath+fileName

        burningImageService.doWith(imageFile, grailsApplication.config.retouch.imageUploadPath).execute (fileNameLarge,
                {
                    it.scaleApproximate(800, 800)
                })
                .execute (fileNameThumb,
                {
                    it.scaleApproximate(400, 400)
                })


        //Write Original File
        def File uploadedImage = new File(productImagePath)
        println productImagePath
        imageFile.transferTo(uploadedImage) //Writing Original File

        return fileName
    }

    private static String getFileExtension(String fileName) {
        int lastIndexOf = fileName.lastIndexOf(".");
        if (lastIndexOf == -1) {
            return ""; // empty extension
        }
        return fileName.substring(lastIndexOf);
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
