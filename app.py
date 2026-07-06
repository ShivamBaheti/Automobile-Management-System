from flask import Flask, render_template, request, redirect
from db import get_connection

app = Flask(__name__)

# HOME – READ
@app.route("/")
def index():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "SELECT automobile_id, make, price, city_mpg FROM automobile"
    )
    cars = cursor.fetchall()
    conn.close()
    return render_template("index.html", cars=cars)


# SEARCH – FILTER
@app.route("/search")
def search():
    keyword = request.args.get("q")
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "SELECT automobile_id, make, price, city_mpg FROM automobile WHERE make LIKE %s",
        ('%' + keyword + '%',)
    )
    cars = cursor.fetchall()
    conn.close()
    return render_template("index.html", cars=cars)


# ADD – CREATE
@app.route("/add", methods=["GET", "POST"])
def add():
    if request.method == "POST":
        make = request.form["make"]
        price = request.form["price"]
        city_mpg = request.form["city_mpg"]

        if not make or not price:
            return "Invalid input"

        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO automobile (make, price, city_mpg) VALUES (%s, %s, %s)",
            (make, price, city_mpg)
        )
        conn.commit()
        conn.close()
        return redirect("/")

    return render_template("add.html")


# UPDATE – UPDATE
@app.route("/update/<int:id>", methods=["GET", "POST"])
def update(id):
    conn = get_connection()
    cursor = conn.cursor()

    if request.method == "POST":
        new_price = request.form["price"]
        cursor.execute(
            "UPDATE automobile SET price=%s WHERE automobile_id=%s",
            (new_price, id)
        )
        conn.commit()
        conn.close()
        return redirect("/")

    cursor.execute(
        "SELECT automobile_id, make, price FROM automobile WHERE automobile_id=%s",
        (id,)
    )
    car = cursor.fetchone()
    conn.close()
    return render_template("update.html", car=car)


# DELETE – DELETE
@app.route("/delete/<int:id>")
def delete(id):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "DELETE FROM automobile WHERE automobile_id=%s",
        (id,)
    )
    conn.commit()
    conn.close()
    return redirect("/")


if __name__ == "__main__":
    app.run(debug=True)