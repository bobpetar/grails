package com.retouch

class TechniqueInvoice {
    Double ratePerTechnique
	static belongsTo = [user:User, task:Task, technique:Technique]
    static constraints = {
		user(blank:false, nullable:false)
		task(blank:false, nullable:false)
		technique(unique:false, nullable:false, blank:false)
        ratePerTechnique(nullable: false, blank:false)
    }

}
