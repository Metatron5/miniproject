import streamlit as st
import pandas as pd
from sqlalchemy import text

def main():
    st.title("Hochschul Kursplattform")

    conn = st.connection("postgresql", type="sql")

    # --- Kurs belegen ---
    st.header("Kurs belegen")

    with st.form("belegen_form"):
        student_id = st.number_input("Student ID", min_value=1)
        course_id = st.number_input("Kurs ID", min_value=1)

        submit = st.form_submit_button("Belegen")

        if submit:
            try:
                with conn.session as s:
                    s.execute(
                        text("INSERT INTO belegt (student_id, course_id) VALUES (:s, :c)"),
                        {"s": student_id, "c": course_id}
                    )
                    s.commit()

                st.success("Kurs wurde erfolgreich belegt.")

            except Exception as e:
                st.error(f"Fehler: {e}")

    # --- Belegte Kurse anzeigen ---
    st.header("Belegte Kurse anzeigen")

    sid = st.number_input("Student ID anzeigen", min_value=1)

    if st.button("Anzeigen"):
        try:
            df = conn.query("""
                SELECT 
                    s.first_name as Studenten_Vorname,
                    s.last_name as Studenten_Nachname,
                    c.title as Kursname,
                    c.credits as Credits,
                    i.first_name AS instructor_Vorname,
                    i.last_name AS instructor_Nachname
                FROM belegt b
                JOIN student s ON b.student_id = s.student_id
                JOIN course c ON b.course_id = c.course_id
                JOIN fuehrt f ON c.course_id = f.course_id
                JOIN instructor i ON f.instructor_id = i.instructor_id
                WHERE s.student_id = :sid;
            """, params={"sid": sid})

            st.dataframe(df)

        except Exception as e:
            st.error(f"Fehler: {e}")


if __name__ == "__main__":
    main()
