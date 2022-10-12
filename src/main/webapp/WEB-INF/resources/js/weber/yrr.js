Swal.fire({
				title: '當日預訂情況:',
				html: result,
				input: 'select',
				inputOptions: {
					'Fruits': {
						apples: 'Apples',
						bananas: 'Bananas',
						grapes: 'Grapes',
						oranges: 'Oranges'
					},
					'Vegetables': {
						potato: 'Potato',
						broccoli: 'Broccoli',
						carrot: 'Carrot'
					},
					'icecream': 'Ice cream'
				},
				preConfirm: (login) => {
					return fetch(`//api.github.com/users/${login}`)
						.then(response => {
							if (!response.ok) {
								throw new Error(response.statusText)
							}
							return response.json()
						})
						.catch(error => {
							Swal.showValidationMessage(
								`Request failed: ${error}`
							)
						})
				},
			})
			
			
			
$('.searchRoomStatus').on('click', function(e) {
	console.log(e.target.closest('form'))
	var form = new FormData(e.target.closest('form'))
	$.ajax({
		url: "searchRoomStatus?styleID=" + form.get('styleID'),
		type: "get", //請求方式
		// 	    	  	data: form,
		// 	    	  	data: {"orderid": data}, //需要上傳的數據
		// 	    	  	contentType:"application/json",
		dataType: "JSON", //設置接受到的響應數據的格式
		success: function(data) {
			var result = ''
			var eachData = ''
			var eachRow = ''
			$.each(data, function(index, ele) {
				eachData += `<th>${ele.roomID}</th>`
				eachRow += "<td></td>"
			})
			result +=
				`
				<table id="target" class="table table-hover">
    				<thead>
              			<tr>
              			${eachData}
              			</tr>
            		</thead>
            		<tbody>
						<tr>
						${eachRow}
		              	</tr>
					</tbody>
				</table>
				`
			$('#roomDetailArea').empty()
			$('#roomDetailArea').append(result)
		}
	})
})

const steps = ['1', '2', '3']
const swalQueueStep = Swal.mixin({
  confirmButtonText: 'Forward',
  cancelButtonText: 'Back',
  progressSteps: steps,
  input: 'text',
  inputAttributes: {
    required: true
  },
  reverseButtons: true,
  validationMessage: 'This field is required'
})

const values = []
let currentStep

for (currentStep = 0; currentStep < steps.length;) {
  const result = await swalQueueStep.fire({
    title: `Question ${steps[currentStep]}`,
    inputValue: values[currentStep],
    showCancelButton: currentStep > 0,
    currentProgressStep: currentStep
  })

  if (result.value) {
    values[currentStep] = result.value
    currentStep++
  } else if (result.dismiss === Swal.DismissReason.cancel) {
    currentStep--
  } else {
    break
  }
}

if (currentStep === steps.length) {
  Swal.fire(JSON.stringify(values))
}
