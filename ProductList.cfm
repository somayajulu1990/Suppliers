<!DOCTYPE html>
<html>
	<head>
		<title>Supplier</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/fontawesome.css">
		<style>
			hr{
				border: 2px solid #ccc;
			}
			.blueicon{
				color: blue;
			}
			.greyHeader{
				background-color: grey;
				color: white;
				font-size: 14px;
				padding: 10px;
			}
			.colBroder {
				border: 1px solid black;
			}
			.smallDesc{
				font-style: italic;
				font-size: 12px;
				padding-bottom: 10px;
			}
			.SupLogo{
				height: 150px;
    			border: 1px solid #ccc;
			}
			.pad_bot{
				padding-bottom: 10px;
			}
			.productHeader{
				width: 10%;
				border: 1px solid;
				text-align: center;
				padding: 3px;
				position: absolute;
				top: 7px;
				z-index: 999;
				background-color: white;
			}
			.ProductImage{
				height: 200px;
				border: 1px solid #ccc;
				margin: 5px;
			}
			.bordr{
				border:1px solid #ccc;
				margin: 10px;
			}
		</style>
	</head>
    <cfparam  name="url.Sid" default="0">
    <cfparam  name="url.active" default="1">
    <cfparam  name="url.checked" default="0">
	<cfif val(url.Sid)>
		<cfinvoke method="getSupplierList" component="Suppliers" returnvariable="variables.SupplierList">
			<cfinvokeargument name="Sup_ID" value="#url.Sid#">
		</cfinvoke>
		<cfinvoke method="getProductList" component="Suppliers" returnvariable="variables.ProductList">
			<cfinvokeargument name="Sup_ID" value="#url.Sid#">
			<cfinvokeargument name="active" value="#url.active#">
		</cfinvoke>
		<body><cfoutput>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<img src="" alt="LOGO" width="40" height="20">
					</div>
				</div>
				<div class="row pad_bot">
					<div class="col-md-3">
						<div class="SupLogo">
							<img src="#variables.SupplierList.Sup_Logo#">
						</div>
					</div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-12">
								<h3>#variables.SupplierList.supplier_name#</h3>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 smallDesc">
								#variables.SupplierList.Sup_Location#
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 Description">
								#variables.SupplierList.Sup_Desc#
							</div>
						</div>
					</div>
					<div class="col-md-1">
						<a href="index.cfm" class="btn btn-primary">Back</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="productHeader">
							Products
						</div>
						<hr style="border-style: dashed;position: relative;z-index: 111;"/>
					</div>
				</div>
				<div class="row pull-right">
					<div class="col-md-12">
						<input type="checkbox" name="Inactive" class="Inactive" <cfif url.checked EQ 1>checked</cfif>>
						<label>Show Inactive Products</label>
					</div>
				</div>
				<div class="row">
					<cfset counter = 0>
					<cfloop query="variables.ProductList">
						<cfset counter+= 1>
						<div class="col-md-2 bordr">
							<div class="col-md-12">
								<div class="ProductImage"><img src="#variables.ProductList.ProductLogo#"></div>
							</div>
							<div class="col-md-12">#variables.ProductList.product_title#</div>
						</div>
						<cfif counter % 4 EQ 0>
							</div>
							<div class="row">
						</cfif>
					</cfloop>
				</div>
			</div></cfoutput>
		</body>
	<cfelse>
		<body>No Data Available.</body>
	</cfif>
	<script>
		$(".Inactive").on("change", function(){
			if(this.checked) {
				location.href ="ProductList.cfm?Sid=<cfoutput>#variables.SupplierList.supplier_id#</cfoutput>&checked=1&active=0";
			} else{
				location.href ="ProductList.cfm?Sid=<cfoutput>#variables.SupplierList.supplier_id#</cfoutput>&checked=0&active=1";
			}
		})
	</script>
</html>