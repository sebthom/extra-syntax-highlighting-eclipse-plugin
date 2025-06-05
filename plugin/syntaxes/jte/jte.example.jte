@import java.util.List
@import java.util.Map
@import java.time.LocalDateTime
@import java.time.format.DateTimeFormatter

@param String title
@param String description
@param List<String> items
@param Map<String, String> metadata

@def greeting(String name) {
    <p>Hello, ${name}!</p>
}
@end

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    @if (description != null && !description.isEmpty()) {
        <meta name="description" content="${description}">
    }
</head>
<body>
    <header>
        <h1>${title}</h1>
    </header>
    <main>
        <section>
            <h2>Greeting</h2>
            @greeting("World")
        </section>

        <section>
            <h2>Items</h2>
            @if (items != null && !items.isEmpty()) {
                <ul>
                    @for (String item : items) {
                        <li>${item}</li>
                    }
                </ul>
            } @else {
                <p>No items available.</p>
            }
        </section>

        <section>
            <h2>Metadata</h2>
            <dl>
                @for (Map.Entry<String, String> entry : metadata.entrySet()) {
                    <dt>${entry.getKey()}</dt>
                    <dd>${entry.getValue()}</dd>
                }
            </dl>
        </section>

        <section>
            <h2>Current Time</h2>
            <p>${LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))}</p>
        </section>
    </main>
    <footer>
        <p>&copy; 2025 Example Company</p>
    </footer>
</body>
</html>
