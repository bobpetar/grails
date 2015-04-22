package com.retouch

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class PublicController {

    def index() {
        def Random randomGenerator = new Random()
        int videoNumber = randomGenerator.nextInt(5)
        def techniqueInstanceList = Technique.findAllByIsDeleted(false)
        Set uniqueGroep = techniqueInstanceList.groep
        def testimonialCustomerList = Testimonial.findAllByUserType('Customer')
        def testimonialRetoucherList = Testimonial.findAllByUserType('Retoucher')
        [techniqueInstaneList:techniqueInstanceList, uniqueGroep:uniqueGroep,videoNumber:videoNumber, testimonialCustomerList:testimonialCustomerList, testimonialRetoucherList:testimonialRetoucherList]
    }

    @Secured(['permitAll'])
    def index2() {
        def Random randomGenerator = new Random()
        int videoNumber = randomGenerator.nextInt(5)
        def techniqueInstanceList = Technique.findAllByIsDeleted(false)
        Set uniqueGroep = techniqueInstanceList.groep
        def testimonialCustomerList = Testimonial.findAllByUserType('Customer')
        def testimonialRetoucherList = Testimonial.findAllByUserType('Retoucher')
        [techniqueInstaneList:techniqueInstanceList, uniqueGroep:uniqueGroep,videoNumber:videoNumber, testimonialCustomerList:testimonialCustomerList, testimonialRetoucherList:testimonialRetoucherList]
    }


    @Secured(['permitAll'])
    def index3() {
        def Random randomGenerator = new Random()
        int videoNumber = randomGenerator.nextInt(5)
        def techniqueInstanceList = Technique.findAllByIsDeleted(false)
        Set uniqueGroep = techniqueInstanceList.groep
        def testimonialCustomerList = Testimonial.findAllByUserType('Customer')
        def testimonialRetoucherList = Testimonial.findAllByUserType('Retoucher')
        [techniqueInstaneList:techniqueInstanceList, uniqueGroep:uniqueGroep,videoNumber:videoNumber, testimonialCustomerList:testimonialCustomerList, testimonialRetoucherList:testimonialRetoucherList]
    }
}
