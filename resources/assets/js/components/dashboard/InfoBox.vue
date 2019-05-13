<template>

   <div class="wrap"> 
    <div class="row" v-if="isLoading">
        <h1 style="text-align:center">Loading......</h1>
    </div>

   <div class="row clearfix" v-if="!isLoading">
      
        
            

                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
                    <div class="info-box bg-blue-grey hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">people_outline</i>
                        </div>
                        <div class="content">
                            <div class="text">Total Vendor</div>
                            <div class="number">{{ info.total_vendor }}</div>
                        </div>
                    </div>               
                </div>       


                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
                    <div class="info-box bg-blue hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">sentiment_very_satisfied</i>
                        </div>
                        <div class="content">
                            <div class="text">Total Customer</div>
                            <div class="number">{{ info.total_customer }}</div>
                        </div>
                    </div>               
                </div>

   

                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
                    <div class="info-box bg-pink hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">local_printshop</i>
                        </div>
                        <div class="content">
                            <div class="text">Total Invoice</div>
                            <div class="number">{{ info.total_invoice }}</div>
                        </div>
                    </div>               
                </div>    

                 <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
                    <div class="info-box bg-teal hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">store_mall_directory</i>
                        </div>
                        <div class="content">
                            <div class="text">Total Product</div>
                            <div class="number">{{ info.total_product }}</div>
                        </div>
                    </div>               
                </div> 

                 <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
         
                    <div class="info-box-2 bg-purple hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">input</i>
                        </div>
                        <div class="content">
                            <div class="text">Total Stock Quantity</div>
                            <div class="number"><small>{{ info.total_quantity }}</small></div>
                        </div>
                    </div>             
                </div> 

                 <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
         
                    <div class="info-box-2 bg-grey hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">first_page</i>
                        </div>
                        <div class="content">
                            <div class="text">Total Sold Quantity</div>
                            <div class="number"><small>{{ info.total_sold_quantity }}</small></div>
                        </div>
                    </div>             
                </div>         


                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
         
                    <div class="info-box-2 bg-indigo hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">equalizer</i>
                        </div>
                        <div class="content">
                            <div class="text">Current  Quantity</div>
                            <div class="number"><small>{{ info.total_current_quantity }}</small></div>
                        </div>
                    </div>             
                </div> 
                
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
         
                    <div class="info-box-2 bg-black hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">strikethrough_s</i>
                        </div>
                        <div class="content">
                            <div class="text">Total Sold Amount</div>
                            <div class="number"><small>৳{{ info.total_sold_amount }}</small></div>
                        </div>
                    </div>             
                </div> 


                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
         
                    <div class="info-box-2 bg-brown hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">multiline_chart</i>
                        </div>
                        <div class="content">
                            <div class="text">Total Paid Amount</div>
                            <div class="number"><small>৳{{ info.total_paid_amount }}</small></div>
                        </div>
                    </div>             
                </div>         



                 <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
         
                    <div class="info-box-2 bg-ddd hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons" style="color: #000">linear_scale</i>
                        </div>
                        <div class="content">
                            <div class="text">Total Outstanding</div>
                            <div class="number"><small>৳{{ info.total_outstanding }}</small></div>
                        </div>
                    </div>             
                </div>


                 <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
         
                    <div class="info-box-2 bg-blue hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons" >all_inclusive</i>
                        </div>
                        <div class="content">
                            <div class="text">Profit</div>
                            <div class="number"><small>৳{{ info.total_gross_profit }}</small></div>
                        </div>
                    </div>             
                </div> 


         <!--         <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">              
         
                    <div class="info-box-2 bg-deep-purple hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons" >show_chart</i>
                        </div>
                        <div class="content">
                            <div class="text">Net Profit</div>
                            <div class="number"><small>৳{{ info.total_net_profit }}</small></div>
                        </div>
                    </div>             
                </div> --> 
                
 
    
    </div>
    </div>
</template>

<script>
import {EventBus} from '../../vue-asset';
import mixin from '../../mixin';
export default {
    
    data(){

        return {
         
         info : {},
         isLoading : true,

        }
    },

    created(){

        this.getData();
    },
    methods : {

        getData(){
         
         axios.get(base_url+'info-box')
         .then(response => {
           
           this.info = response.data;
           this.isLoading = false;

         })

        }
    }

}
</script>

