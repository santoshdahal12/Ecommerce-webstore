<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<script>
    function deleteProduct(event){
        var product_id = $(event).val();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
   
    	$.ajax({
	    		url: "delete_product_r/"+product_id,
	    		beforeSend: function(xhr){xhr.setRequestHeader(header, token);},
	    		type:"DELETE", 
	    		error: function(response) {
	    			$("#div1").html("Cannot be deleted!");
	            },
	    		success: function(result,status)
	        	{
	            	$("#div1").html("Delete "+status);
	            	location.reload();	
	        	} 
	            	
	    		}
    		);
    } 
    

    $(document).ready(function() {
        $('#plist').DataTable();
    } );
</script>

<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Product
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-12 connectedSortable">
              <!-- TO DO List -->
          <div class="box box-primary">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>

              <h3 class="box-title">List Product</h3>
			 	<table id="plist" class="table table-striped table-bordered" >
					<thead>
						<tr>
							<th>Name</th>
						    <th>Availability</th> 
						    <th>Price</th>
						    <th>Action</th>
						</tr>
					</thead>
					<tbody>
						 <c:forEach items="${products}" var="product">
					            <tr>
					            	<td><c:out value="${product.name}"/></td>
					            	<td><c:out value="${product.productAvailability}"/></td>
					            	<td><c:out value="${product.price}"/></td>
					            	<td>
					            		<button value="${product.id}" onclick="deleteProduct(this)" class="btn btn-danger btn-xs">Delete</button>
					            		|
					            		<a class="btn btn-warning btn-xs" href="product/edit/${product.id}">Edit</a>
					            	</td>
					            </tr>
					     </c:forEach> 
				     </tbody>
			     </table>    	
		<br>
		<div id="div1"></div>	
          </div>
          <!-- /.box -->
        </section>
        <!-- /.Left col -->
      </div>
      <!-- /.row (main row) -->
		</div>
    </section>
    <!-- /.content -->		
		
		
