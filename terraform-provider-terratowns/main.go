package main


import (
	//"fmt"
	//"log"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	//"github.com/google/uuid"
)


func main() {
	// func main defines the entry point into Go applications
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})
}

//func validateUUID(v interface{}, k string)(ws []string, errors []error){
//	log.Print('validateUUID:start')
//	value := v.(string)
//
//	if _,err = uuid.Parse(value); err != nil{
//		errors = append(error, fmt.Errorf("invalid UUID format"))
//	}
//	log.Print('validateUUID:end')
//}


func Provider() *schema.Provider{
	var p *schema.Provider
	p = &schema.Provider{
		ResourcesMap: map[string]*schema.Resource{},
		DataSourcesMap: map[string]*schema.Resource{},
		Schema: map[string]*schema.Schema{
			"endpoint": {
				Type: schema.TypeString,
				Required: true,
				Description: "Endpoint for the external service",
			},
			"token" : {
				Type: schema.TypeString,
				Required: true,
				Sensitive: true,
				Description: "Bearer Token for authorization",
			},
			"user_uuid" : {
				Type: schema.TypeString,
				Required: true,
				Description: "UUID for configuration",
				//ValidateFunc: 
			},
		},
	}
	// p.ConfigureContextFunc = providerConfigure(p)
	return p
}