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
		</style>
	</head>
	<cfinvoke method="getSupplierList" component="Suppliers" returnvariable="variables.SupplierList"></cfinvoke>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<img src="" alt="LOGO" width="40" height="20">
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="colBroder col-md-1 greyHeader">&nbsp;</div>
						<div class="colBroder col-md-10 greyHeader">Suppliers</div>
						<div class="colBroder col-md-1 greyHeader">Active/Total</div>
					</div>
					<cfloop query="variables.SupplierList">
						<cfoutput>
							<div class="row">
								<div class="colBroder col-md-1">
									<a href="ProductList.cfm?Sid=#variables.SupplierList.supplier_id#">
										<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
									</a>
								</div>
								<div class="colBroder col-md-10">
									<a href="ProductList.cfm?Sid=#variables.SupplierList.supplier_id#">
										#variables.SupplierList.supplier_name#
									</a>
								</div>
								<div class="colBroder col-md-1">
									#variables.SupplierList.activeCount#/#variables.SupplierList.TotalCount#
								</div>
							</div>
						</cfoutput>
					</cfloop>
				</div>
			</div>
		</div>
	</body>
</html>