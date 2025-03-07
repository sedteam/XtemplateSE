<!-- BEGIN: MAIN -->
<html>
<head>
    <title>Test Template - {USERNAME}</title>
</head>
<body>
    <h1>Welcome, {USERNAME}!</h1>
    <p>Last login: {LAST_LOGIN|strtotime|date('Y-m-d', $this)}</p>

    <!-- BEGIN: USER_INFO -->
    <div class="user-info">
        <!-- IF {IS_ADMIN} -->
        <p class="admin">You are an admin (Level: {USER_LEVEL}).</p>
        <!-- IF {USER_LEVEL} >= 5 -->
        <p>Senior admin privileges granted.</p>
        <!-- ELSE -->
        <p>Junior admin privileges.</p>
        <!-- ENDIF -->
        <!-- ELSE -->
        <p>You are a regular user.</p>
        <!-- ENDIF -->

        <!-- IF {USER_SCORE} > 80 -->
        <p class="highlight">Great job! Your score is {USER_SCORE}.</p>
        <!-- IF {USER_SCORE} > 90 -->
        <span>Elite status achieved!</span>
        <!-- ELSE -->
        <span>Almost elite - keep pushing!</span>
        <!-- ENDIF -->
        <!-- ELSE -->
        <p>Your score is {USER_SCORE}. Keep improving!</p>
        <!-- ENDIF -->
    </div>
    <!-- END: USER_INFO -->

    <!-- BEGIN: ITEMS_LIST -->
    <h2>Items List</h2>
    <ul class="items">
        <!-- FOR {ITEM} IN {ITEMS} -->
        <li>
            {ITEM.name} - ${ITEM.price}
            <!-- IF {ITEM.discount} > 0 -->
            (Discount: ${ITEM.discount}, Final: ${ITEM.price - ITEM.discount})
            <!-- ELSE -->
            (No discount)
            <!-- ENDIF -->
            <!-- IF {ITEM.category} == "Books" -->
            <span class="category">[Book]</span>
            <!-- ENDIF -->
        </li>
        <!-- ENDFOR -->
    </ul>
    <!-- END: ITEMS_LIST -->

    <!-- BEGIN: CATEGORIES_LIST -->
    <h2>Categories</h2>
    <!-- FOR {CAT_NAME}, {CAT_DATA} IN {CATEGORIES} -->
    <div class="category">
        <h3>{CAT_NAME}</h3>
        <!-- IF {CAT_DATA.products} -->
        <ul class="products">
            <!-- FOR {PRODUCT} IN {CAT_DATA.products} -->
            <li>
                {PRODUCT.product} (Stock: {PRODUCT.stock}, Price: ${PRODUCT.price})
                <!-- IF {PRODUCT.is_new} -->
                <span class="new"> - New!</span>
                <!-- ENDIF -->
                <!-- IF {PRODUCT.stock} > 5 -->
                - In stock
                <!-- ELSE -->
                - Low stock
                <!-- IF {PRODUCT.stock} == 0 -->
                (Out of stock!)
                <!-- ENDIF -->
                <!-- ENDIF -->
            </li>
            <!-- ENDFOR -->
        </ul>
        <!-- ENDIF -->

        <!-- IF {CAT_DATA.subcategories} -->
        <h4>Subcategories</h4>
        <!-- FOR {SUBCAT_NAME}, {SUBCAT_PRODUCTS} IN {CAT_DATA.subcategories} -->
        <div class="subcategory">
            <h5>{SUBCAT_NAME}</h5>
            <ul>
                <!-- FOR {PRODUCT} IN {SUBCAT_PRODUCTS} -->
                <li>
                    {PRODUCT.product} - ${PRODUCT.price}
                    <!-- IF {PRODUCT.stock} > 10 -->
                    <span class="stock-high">High stock ({PRODUCT.stock})</span>
                    <!-- ELSE -->
                    <span class="stock-low">Low stock ({PRODUCT.stock})</span>
                    <!-- ENDIF -->
                </li>
                <!-- ENDFOR -->
            </ul>
        </div>
        <!-- ENDFOR -->
        <!-- ENDIF -->
    </div>
    <!-- ENDFOR -->
    <!-- END: CATEGORIES_LIST -->

    <!-- BEGIN: STATS -->
    <div class="stats">
        <h2>Statistics</h2>
        <p>Total Items: {STATS.total_items}</p>
        <p>Total Categories: {STATS.total_categories}</p>
        <p>Average Price: ${STATS.average_price|round($this, 2)}</p>
        <p>Last Updated: {STATS.last_updated|strtotime}</p>
        <!-- IF {STATS.total_items} > 3 -->
        <p class="note">Large inventory detected!</p>
        <!-- ENDIF -->
    </div>
    <!-- END: STATS -->

</body>
</html>
<!-- END: MAIN -->