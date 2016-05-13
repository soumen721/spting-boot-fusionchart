<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="content" style="text-align: center">
	<h2>Product Information</h2>
	<form:form method="POST" action="${pageContext.request.contextPath}/addproduct">
		<table>
			<tr>
				<td><form:label path="name">Product Name : </form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="type">Product Type : </form:label></td>
				<td>
					<select id="type" name="type" style="width:170px">
					    <!-- <option value="all">All</option> -->
					    <option value="Mobile">Mobile</option>
					    <option value="Calc">Calculator</option>
					    <option value="Laptop">Laptop</option>
					    <option value="Tech">Technology</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><form:label path="price">Product Price : </form:label></td>
				<td><form:input path="price" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form:form>
</div>