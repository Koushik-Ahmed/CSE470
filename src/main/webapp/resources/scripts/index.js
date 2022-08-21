var toastTrigger = document.getElementById('addToCartBtn')
var toastMessage = document.getElementById('addedToCartToast')
if (toastTrigger) {
	toastTrigger.addEventListener('click', function() {
		var toast = new bootstrap.Toast(toastMessage)
		
		console.log("Hello World!");
		
		$(function() {
			$("#cartForm").on("submit", function(e) {
				e.preventDefault();
				$.ajax({
					url: $(this).attr("action"),
					type: 'POST',
					data: $(this).serialize(),
					success: function() {
						toast.show()
					}
				});
			});
		});
	})
}
