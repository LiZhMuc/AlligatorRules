%
% File: AML_rules.pl
%

:-dynamic(refSemantic/2).
:-dynamic(sameEClassSpec/2).
:-dynamic(hasRoleClassLib/2).
:-dynamic(hasRoleClass/2).
:-dynamic(roleClassRefSem/2).
:-dynamic(classificationClass/2).
:-dynamic(sameClassification/2).
:-dynamic(eClassVersion/2).
:-dynamic(eClassIRDI/2).
:-dynamic(sameEClassVersion/2).
:-dynamic(sameEClassIRDI/2).
:-dynamic(sameAttribute/2).
:-dynamic(sameRoleClass/2).
:-dynamic(sameRoleClassLib/2). 
:-dynamic(sameCAEXFile/2).
:-dynamic(hasAttribute/2).
:-dynamic(sameAttributeRoleClass/2).
:-dynamic(hasCorrespondingAttributePath/2).
:-dynamic(sameRefSemantic/2).
:-dynamic(hasRefSemantic/2).
:-dynamic(hasAttributeName/2).
:-dynamic(hasAttributeValue/2).
:-dynamic(type/2).
:-dynamic(eClassClassificationAtt/2).
:-dynamic(eClassVersionAtt/2).
:-dynamic(eClassIRDIAtt/2).
:-dynamic(sameInterfaceClass/2).
:-dynamic(type/2).
:-dynamic(sameEClassificationRoleClass/2).
:-dynamic(sameRoleClassLib/2).
:-dynamic(sameSystemUnitClass/2).
:-dynamic(sibling/2).

% Attributes are the same if the have the same refSemantic 
clause1(sameAttribute(X,Y),( hasRefSemantic(X,T),hasRefSemantic(Y,Z),sameRefSemantic(T,Z) )).
clause1(sameRefSemantic(X,Y),(hasCorrespondingAttributePath(X,Z),hasCorrespondingAttributePath(Y,Z))).
clause1(sameRefSemantic(X,Y),(sameRefSemantic(X,Z),sameRefSemantic(Z,Y))).

% Testing
clause1(sameAttributeRoleClass(Z,T),(sameAttribute(X,Y),hasAttribute(Z,X),hasAttribute(T,Y))).

% Attributes related to eClass
clause1(eClassClassificationAtt(X,Y),(hasAttributeName(X,'eClassClassificationClass'),
                                     hasAttributeName(Y,'eClassClassificationClass'),
                                     hasAttributeValue(X,Z),
                                     hasAttributeValue(Y,Z))
                                     ).
                                     
clause1(eClassVersionAtt(X,Y),(hasAttributeName(X,'eClassVersion'),
                               hasAttributeName(Y,'eClassVersion'),
                               hasAttributeValue(X,Z),
                               hasAttributeValue(Y,Z),
                               sibling(X,T1),
                               sibling(Y,T2),
                               eClassIRDIAtt(T1,T2)
                               )).                                     

clause1(eClassIRDIAtt(X,Y),(  hasAttributeName(X,'eClassIRDI'),
                              hasAttributeName(Y,'eClassIRDI'),
                              hasAttributeValue(X,Z),
                              hasAttributeValue(Y,Z))
                              ).                                     

clause1(sameRoleClass(X,Y),(  
                             type(X,roleClass),
                             type(Y,roleClass),
                             eClassClassificationAtt(A,B),
                             eClassVersionAtt(C,D),
                             eClassIRDIAtt(E,F),
                             hasAttribute(X,A),
                             hasAttribute(X,C),
                             hasAttribute(X,E),
                             hasAttribute(Y,B),
                             hasAttribute(Y,D),
                             hasAttribute(Y,F)
                             )).                             
                             
clause1(sameEClassificationRoleClass(Z,T),(  
                             type(Z,roleClass),
                             type(T,roleClass),
                             hasAttributeName(Z,'eClassClassSpecification'),
                             hasAttributeName(T,'eClassClassSpecification')
                             )).                             
                             
clause1(sameInterfaceClass(Z,T),(
                             type(Z,interfaceClass),
                             type(T,interfaceClass), 
                             eClassClassificationAtt(X,Y),
                             eClassVersionAtt(B,C),
                             eClassIRDIAtt(D,E),
                             hasAttribute(Z,X),
                             hasAttribute(Z,B),
                             hasAttribute(Z,D),
                             hasAttribute(T,Y),
                             hasAttribute(T,C),
                             hasAttribute(T,E)
                             )).                             

clause1(sameRoleClassLib(X,Y),(
                             sameEClassificationRoleClass(Z,T),
                             hasRoleClass(X,Z),
                             hasRoleClass(Y,T)
                             )). 
                             
clause1(sameSystemUnitClass(Z,T),(
                             type(Z,systemUnitClass),
                             type(T,systemUnitClass), 
                             eClassClassificationAtt(X,Y),
                             eClassVersionAtt(B,C),
                             eClassIRDIAtt(D,E),
                             hasAttribute(Z,X),
                             hasAttribute(Z,B),
                             hasAttribute(Z,D),
                             hasAttribute(T,Y),
                             hasAttribute(T,C),
                             hasAttribute(T,E)
                             )).  

clause1(sibling(X,Y),(hasAttribute(Z,X),hasAttribute(Z,Y))).

                             