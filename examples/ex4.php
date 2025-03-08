<?php

require_once '../XTemplate.php';

$xtpl = new XTemplate('ex.tpl');
$xtpl->debug = true;
$xtpl->debugOutput = false;

$xtpl->assign('USERNAME', 'John Doe');
$xtpl->assign('IS_ADMIN', true);
$xtpl->assign('USER_SCORE', 85);
$xtpl->assign('USER_LEVEL', 7);
$xtpl->assign('LAST_LOGIN', '2025-03-05 14:30:00');

$xtpl->parse('MAIN.USER_INFO');

$xtpl->assign('ITEMS', [
    ['name' => 'Item 1', 'price' => 10, 'discount' => 2, 'category' => 'Books'],
    ['name' => 'Item 2', 'price' => 20, 'discount' => 0, 'category' => 'Electronics'],
    ['name' => 'Item 3', 'price' => 30, 'discount' => 5, 'category' => 'Books'],
]);
$xtpl->parse('MAIN.ITEMS_LIST');

$xtpl->assign('CATEGORIES', [
    'Electronics' => [
        'products' => [
            ['product' => 'Phone', 'stock' => 5, 'price' => 300, 'is_new' => true],
            ['product' => 'Laptop', 'stock' => 2, 'price' => 1200, 'is_new' => false],
        ],
        'subcategories' => [
            'Accessories' => [
                ['product' => 'Charger', 'stock' => 15, 'price' => 20, 'is_new' => true],
            ],
        ],
    ],
    'Books' => [
        'products' => [
            ['product' => 'Novel', 'stock' => 10, 'price' => 15, 'is_new' => false],
            ['product' => 'Textbook', 'stock' => 3, 'price' => 50, 'is_new' => true],
        ],
        'subcategories' => [],
    ],
]);
$xtpl->parse('MAIN.CATEGORIES_LIST');

$xtpl->assign('STATS', [
    'total_items' => 5,
    'total_categories' => 2,
    'average_price' => 117.4,
    'last_updated' => '2025-03-06 09:15:00',
]);
$xtpl->parse('MAIN.STATS');

$xtpl->parse('MAIN');
$xtpl->out('MAIN');


$debugInfo = XtplDebugger::display();

echo "Debug info:\n";
echo $debugInfo;

XtplDebugger::clear();

?>