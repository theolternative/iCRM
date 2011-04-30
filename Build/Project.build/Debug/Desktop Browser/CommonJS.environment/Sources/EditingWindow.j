@STATIC;1.0;I;21;Foundation/CPObject.jt;3629;

objj_executeFile("Foundation/CPObject.j", NO);

editingWindow = nil;

{var the_class = objj_allocateClassPair(CPObject, "EditingWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("returnCode"), new objj_ivar("childView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("childView"), function $EditingWindow__childView(self, _cmd)
{ with(self)
{
return childView;
}
},["id"]),
new objj_method(sel_getUid("setChildView:"), function $EditingWindow__setChildView_(self, _cmd, newValue)
{ with(self)
{
childView = newValue;
}
},["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("showEditingWindowWithView:delegate:endSelector:"), function $EditingWindow__showEditingWindowWithView_delegate_endSelector_(self, _cmd, aView, aDelegate, aSelector)
{ with(self)
{
 var application = objj_msgSend(CPApplication, "sharedApplication");

 if( !editingWindow )
 {
        editingWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0, 0, 500, 350), CPDocModalWindowMask | CPClosableWindowMask);
  var contentView = objj_msgSend(editingWindow, "contentView");
  var bounds = objj_msgSend(contentView, "bounds");

        var okButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:",  CGRectMake(380, 310, 100, 18));
        objj_msgSend(okButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
        objj_msgSend(okButton, "setTitle:", "OK");
        objj_msgSend(okButton, "setTarget:", self);
  objj_msgSend(okButton, "setBezelStyle:", CPRoundRectBezelStyle);
        objj_msgSend(okButton, "setAction:", sel_getUid("okAction:"));
        objj_msgSend(contentView, "addSubview:", okButton);

        var cancelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:",  CGRectMake(260, 310, 100, 18));
        objj_msgSend(cancelButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
        objj_msgSend(cancelButton, "setTitle:", "Annulla");
        objj_msgSend(cancelButton, "setTarget:", self);
        objj_msgSend(cancelButton, "setAction:", sel_getUid("cancelAction:"));
        objj_msgSend(contentView, "addSubview:", cancelButton);
        childView = nil;
 }
 var bounds = objj_msgSend(aView, "bounds");
 var width = bounds.size.width+40;
 var height = bounds.size.height+80;

 objj_msgSend(editingWindow, "setFrameSize:", CGSizeMake(width, height));
 objj_msgSend(aView, "setFrameOrigin:", CGPointMake(20,20));
 objj_msgSend(objj_msgSend(editingWindow, "contentView"), "addSubview:", aView);
    editingWindow.childView = aView;
 editingWindow.returnCode = 0;
 objj_msgSend(application, "beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:", editingWindow, objj_msgSend(application, "mainWindow"), aDelegate, aSelector, nil);

 return editingWindow;
}
},["CPWindow","CPView","id","SEL"]), new objj_method(sel_getUid("cancelAction:"), function $EditingWindow__cancelAction_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(editingWindow.childView, "removeFromSuperview");
 editingWindow.returnCode=0;
 var application = objj_msgSend(CPApplication, "sharedApplication");
 objj_msgSend(application, "endSheet:", editingWindow);
}
},["void","id"]), new objj_method(sel_getUid("okAction:"), function $EditingWindow__okAction_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(editingWindow.childView, "removeFromSuperview");
 editingWindow.returnCode=1;
 var application = objj_msgSend(CPApplication, "sharedApplication");
 objj_msgSend(application, "endSheet:", editingWindow);
}
},["void","id"])]);
}

