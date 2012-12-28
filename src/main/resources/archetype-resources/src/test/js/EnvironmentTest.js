describe('default environment test',function(){
    it('test environment', function() {
        expect(enyo).not.toBe(null);
        expect(App).not.toBe(null);
    });
});
