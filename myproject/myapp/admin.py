
from django.contrib import admin
from.models import*
from django.utils.html import format_html

admin.site.register(Buyerregister)
admin.site.register(Sellerregister)
admin.site.register(Categories)
admin.site.register(Productdetails)
admin.site.register(Cart)
admin.site.register(Personaldetails)

class BookingAdmin(admin.ModelAdmin):
    list_display = ('buyer','seller','product','quantity','amount','status','bookingstatus')
    ordering = ('buyer',)
    search_fields = ('buyer__user__first_name','seller__user__first_name','product__productname')

    def has_delete_permission(self, request, obj=None):
        return False
    
    def get_actions(self, request):
        actions = super().get_actions(request)
        if 'delete_selected' in actions:
            del actions['delete_selected']
        return actions

    def get_readonly_fields(self, request, obj=None):
        if request.user.groups.filter(name='Hub').exists():
            return [field.name for field in self.model._meta.fields if field.name!='delivery_status']
        return []
        
    def bookingstatus(self, obj):
        return self.style_delivery(obj.delivery_status)
    
    def style_delivery(self, m):
        if m == "Delivered":
            return format_html('<span style="color: green; font-weight: bold;">{}</span>', m)
        else:
            return format_html('<span style="color:blue;font-weight:bold;">{}</span>', m)

    bookingstatus.admin_order_field = 'delivery_status'

admin.site.register(Booking,BookingAdmin)    
# Register your models here.