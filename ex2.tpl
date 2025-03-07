<!-- BEGIN: MAIN -->
<html>
<head>
    <title>Operator Test</title>
</head>
<body>
    <h1>Operator Test</h1>

    <!-- BEGIN: ARITHMETIC -->
    <h2>Arithmetic Operators</h2>
    <p>Addition: {NUM1} + {NUM2} = {NUM1 + NUM2}</p>
    <p>Subtraction: {NUM1} - {NUM2} = {NUM1 - NUM2}</p>
    <p>Multiplication: {NUM1} * {NUM2} = {NUM1 * NUM2}</p>
    <p>Division: {NUM1} / {NUM2} = {NUM1 / NUM2}</p>
    <p>Modulo: {NUM1} % {NUM2} = {NUM1 % NUM2}</p>
    <p>String Concatenation: {STR1} + {STR2} = {STR1 + STR2}</p>
    <!-- END: ARITHMETIC -->

    <!-- BEGIN: COMPARISON -->
    <h2>Comparison Operators</h2>
    <p>Equal (==): {NUM1} == {NUM3} -> <!-- IF {NUM1} == {NUM3} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>Strict Equal (===): {NUM1} === {NUM3} -> <!-- IF {NUM1} === {NUM3} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>Not Equal (!=): {NUM1} != {NUM2} -> <!-- IF {NUM1} != {NUM2} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>Strict Not Equal (!==): {NUM1} !== {NUM3} -> <!-- IF {NUM1} !== {NUM3} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>Less Than (<): {NUM1} < {NUM2} -> <!-- IF {NUM1} < {NUM2} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>Greater Than (>): {NUM1} > {NUM2} -> <!-- IF {NUM1} > {NUM2} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>Less or Equal (<=): {NUM1} <= {NUM2} -> <!-- IF {NUM1} <= {NUM2} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>Greater or Equal (>=): {NUM2} >= {NUM1} -> <!-- IF {NUM2} >= {NUM1} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <!-- END: COMPARISON -->

    <!-- BEGIN: LOGICAL -->
    <h2>Logical Operators</h2>
    <p>AND: ({TRUE1} AND {TRUE2}) -> <!-- IF ( {TRUE1} AND {TRUE2} ) -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>OR: ({TRUE1} OR {FALSE1}) -> <!-- IF ( {TRUE1} OR {FALSE1} ) -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>XOR: ({TRUE1} XOR {TRUE2}) -> <!-- IF ( {TRUE1} XOR {TRUE2} ) -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>NOT: !{TRUE1} -> <!-- IF ! {TRUE1} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>Complex: (({NUM1} > {NUM2}) AND ({NUM3} < {NUM4})) -> <!-- IF ( {NUM1} > {NUM2} ) AND ( {NUM3} < {NUM4} ) -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <!-- END: LOGICAL -->

    <!-- BEGIN: SPECIAL -->
    <h2>Special Operators</h2>
    <p>HAS: {VAL} HAS {ARR} -> <!-- IF {VAL} HAS {ARR} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <p>Contains (~=): {SUBSTR} ~= {STR} -> <!-- IF {SUBSTR} ~= {STR} -->True<!-- ELSE -->False<!-- ENDIF --></p>
    <!-- END: SPECIAL -->

    <!-- BEGIN: EXCEPTIONS -->
    <h2>Exception Handling</h2>
    <p>Division by Zero: {NUM1} / {ZERO} = {NUM1 / ZERO}</p>
    <p>Modulo by Zero: {NUM1} % {ZERO} = {NUM1 % ZERO}</p>
	<p>Modulo by 2: {NUM1} % 2 = {NUM1 % 2}</p>
    <!-- END: EXCEPTIONS -->
</body>
</html>
<!-- END: MAIN -->