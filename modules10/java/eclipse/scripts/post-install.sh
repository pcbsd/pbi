#!/bin/sh

#echo "-XX:CompileCommand=exclude,org/eclipse/cdt/internal/core/dom/parser/cpp/semantics/CPPTemplates,instantiateTemplate
#-XX:CompileCommand=exclude,org/eclipse/cdt/internal/core/pdom/dom/cpp/PDOMCPPLinkage,addBinding
#-XX:CompileCommand=exclude,org/eclipse/core/internal/dtree/DataTreeNode,forwardDeltaWith
#-XX:CompileCommand=exclude,java/text/SimpleDateFormat,subParseZoneString
#-XX:CompileCommand=exclude,org/eclipse/jdt/internal/compiler/lookup/ParameterizedMethodBinding,<init>" >> ${PBI_PROGDIRPATH}/eclipse/eclipse.ini

sed -i '' 's|export |export GDK_NATIVE_WINDOWS=1 |g' ${PBI_PROGDIRPATH}/bin/eclipse
chmod 755 ${PBI_PROGDIRPATH}/bin/eclipse
