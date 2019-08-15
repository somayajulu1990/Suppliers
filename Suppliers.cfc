<cfcomponent>
    <cffunction  name="getSupplierList">
        <cfargument  name="Sup_ID" required="false" default="0">
        <cfquery name="getData" datasource="Suppliers">
            SELECT
                S.supplier_id,
                S.supplier_name,
                S.Sup_Logo,
                S.Sup_Location,
                S.Sup_Desc,
                (
                    SELECT count(product_id) from Master_data where supplier_id = S.supplier_id and is_active = 1
                ) AS activeCount,
                count(M.product_id) AS TotalCount
            FROM
                Suppliers_data S
                left join Master_data M on M.supplier_id = S.supplier_id
            <cfif arguments.Sup_ID GT 0>
                WHERE S.supplier_id = <cfqueryparam value="#arguments.Sup_ID#" cfsqltype="cf_sql_integer">
            </cfif>
			group by s.supplier_id,
                S.supplier_name,
                S.Sup_Logo,
                S.Sup_Location,
                S.Sup_Desc
        </cfquery>
        <cfreturn getData>
    </cffunction>
    <cffunction  name="getProductList">
        <cfargument  name="Sup_ID" required="true">
        <cfargument  name="active" required="false" default="1">
        <cfquery name="getData" datasource="Suppliers">
            SELECT
                M.product_id,
                M.product_title,
                M.ProductLogo
            FROM
                Master_data M
            WHERE M.supplier_id = <cfqueryparam value="#arguments.Sup_ID#" cfsqltype="cf_sql_integer">
            and M.is_active = <cfqueryparam value="#arguments.active#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getData>
    </cffunction>
</cfcomponent>