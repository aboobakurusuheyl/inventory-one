<template>

	<div class="row">
		<div class="col-md-4">
			<div class="input-group">
			<div class="form-line">
				<vuejs-datepicker :required="true" :placeholder="'Date To'" :name="'start_date'" :input-class="'form-control'"></vuejs-datepicker>
			</div>
			</div>
		</div>	

		<div class="col-md-4">
			<div class="input-group">
			<div class="form-line">
				<vuejs-datepicker :required="true" :placeholder="'Date From'" :name="'end_date'" :input-class="'form-control'"></vuejs-datepicker>
			</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="input-group">
			<div class="form-line">
			   <select class="form-control" name="type" required="">
			   	 <option value="">Chose Report Type</option>
			   	 <option value="stock">Stock Report</option>
			   	 <option value="sell">Sell Report</option>
			   	 <option value="profit">Profit Report</option>
			   	 <option value="due">Due Report</option>
			   	 <option value="invoice">Invoice Report</option>
			   </select>
			</div>
			</div>
		</div>
	</div>
	
</template>


<script>
	
  import Datepicker from 'vuejs-datepicker';

	export default{
       
       components : {
         
         'vuejs-datepicker' : Datepicker,
        
       },

       data

	}

</script>