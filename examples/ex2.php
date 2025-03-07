<?php
require_once '../Xtemplate.php';

$xtpl = new XTemplate('ex2.tpl');

$xtpl->debug = true;
$xtpl->debugOutput = false;

// ARITHMETIC
$xtpl->assign('NUM1', 10);
$xtpl->assign('NUM2', 3);
$xtpl->assign('NUM3', '10');
$xtpl->assign('NUM4', 15);
$xtpl->assign('STR1', 'Hello');
$xtpl->assign('STR2', 'World');
$xtpl->assign('ZERO', 0);
$xtpl->parse('MAIN.ARITHMETIC');

// COMPARISON
$xtpl->parse('MAIN.COMPARISON');

// LOGICAL
$xtpl->assign('TRUE1', true);
$xtpl->assign('TRUE2', true);
$xtpl->assign('FALSE1', false);
$xtpl->parse('MAIN.LOGICAL');

// SPECIAL
$xtpl->assign('VAL', 2);
$xtpl->assign('ARR', [1, 2, 3]);
$xtpl->assign('SUBSTR', 'ell');
$xtpl->assign('STR', 'Hello');
$xtpl->parse('MAIN.SPECIAL');

// EXCEPTIONS
$xtpl->parse('MAIN.EXCEPTIONS');

$xtpl->parse('MAIN');
$xtpl->out('MAIN');
