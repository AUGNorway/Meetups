$eventID = New-Guid
$eventDate = $eventDate = Get-Date -Format s
$orderId = (get-random -Maximum 1000) # generate order id. should ideally generate server side adn returned to user.


# event/message body
$htbody = @{
    id          = $eventID
    eventType   = "Takeaway"
    subject     = "Pizza/Order/New"
    eventTime   = $eventDate   
    data        = @{
        "orderId"       = $orderId
        "pizza"      = @{
            "type" = "new-yorker"
            "extras" = @{
                "cheese" = 1
                "ham"    = 1
            }
        }
        "customer"         = @{
            "name"       = "David Dennison"
            "address"       = "1600 Pennsylvania Avenue NW"
            "postalCode" = 20500
            "city" = "Washington DC"
        }
    }
    dataVersion = "1.0"
}


$body = "[" + (ConvertTo-Json $htbody -Depth 4) + "]"

Invoke-RestMethod -Uri "event-grid-uri" -Method POST -Body $body -Headers @{"aeg-sas-key" = "key"}