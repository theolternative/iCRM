@STATIC;1.0;I;21;Foundation/CPObject.jt;4137;

objj_executeFile("Foundation/CPObject.j", NO);

editingWindow = nil;

{var the_class = objj_allocateClassPair(CPObject, "EditingWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("returnCode"), new objj_ivar("childView"), new objj_ivar("scrollView")]);
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
        objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
        var bounds = objj_msgSend(contentView, "bounds");

        var okButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:",  CGRectMake(380, 307, 100, 24));
        objj_msgSend(okButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
        objj_msgSend(okButton, "setTitle:", "OK");
        objj_msgSend(okButton, "setTarget:", self);
        objj_msgSend(okButton, "setBezelStyle:", CPRoundedBezelStyle);
        objj_msgSend(okButton, "setAction:", sel_getUid("okAction:"));
        objj_msgSend(contentView, "addSubview:", okButton);

        var cancelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:",  CGRectMake(260, 307, 100, 24));
        objj_msgSend(cancelButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
        objj_msgSend(cancelButton, "setTitle:", "Annulla");
        objj_msgSend(cancelButton, "setTarget:", self);
        objj_msgSend(cancelButton, "setBezelStyle:", CPRoundedBezelStyle);
        objj_msgSend(cancelButton, "setAction:", sel_getUid("cancelAction:"));
        objj_msgSend(contentView, "addSubview:", cancelButton);

        scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(scrollView, "setAutohidesScrollers:", YES);
        objj_msgSend(contentView, "addSubview:", scrollView);
        childView = nil;
    }
    var bounds = objj_msgSend(aView, "bounds");
    var width = bounds.size.width+60;
    var height = bounds.size.height+100;

    objj_msgSend(editingWindow, "setFrameSize:", CGSizeMake(width, height));
    objj_msgSend(scrollView, "setFrame:", CGRectMake(20,20,bounds.size.width+20, bounds.size.height+20));
    objj_msgSend(scrollView, "setDocumentView:", aView);


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

