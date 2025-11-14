#!/bin/bash
# Test script for the Waterloo CS Assignment Hub API

API_URL="http://127.0.0.1:8000"

echo "=== Testing Waterloo CS Assignment Hub API ==="
echo

# Test 1: Health check
echo "1. Health Check:"
curl -s "$API_URL/health" | python3 -m json.tool
echo
echo

# Test 2: Root endpoint
echo "2. Root Endpoint:"
curl -s "$API_URL/" | python3 -m json.tool
echo
echo

# Test 3: Register a professor
echo "3. Register Professor:"
PROF_RESPONSE=$(curl -s -X POST "$API_URL/api/auth/signup" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "prof_smith",
    "email": "smith@uwaterloo.ca",
    "password": "securepass123",
    "identity": "professor"
  }')
echo "$PROF_RESPONSE" | python3 -m json.tool
PROF_TOKEN=$(echo "$PROF_RESPONSE" | python3 -c "import sys, json; print(json.load(sys.stdin)['access_token'])" 2>/dev/null)
echo
echo

# Test 4: Register a student
echo "4. Register Student:"
STUDENT_RESPONSE=$(curl -s -X POST "$API_URL/api/auth/signup" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "alice_student",
    "email": "alice@uwaterloo.ca",
    "password": "password123",
    "identity": "student"
  }')
echo "$STUDENT_RESPONSE" | python3 -m json.tool
STUDENT_TOKEN=$(echo "$STUDENT_RESPONSE" | python3 -c "import sys, json; print(json.load(sys.stdin)['access_token'])" 2>/dev/null)
echo
echo

# Test 5: Create a course (professor only)
echo "5. Create Course (CS137):"
COURSE_RESPONSE=$(curl -s -X POST "$API_URL/api/courses/" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $PROF_TOKEN" \
  -d '{
    "course_code": "CS137",
    "course_name": "Programming Principles",
    "description": "Introduction to programming in Python and C"
  }')
echo "$COURSE_RESPONSE" | python3 -m json.tool
COURSE_ID=$(echo "$COURSE_RESPONSE" | python3 -c "import sys, json; print(json.load(sys.stdin)['id'])" 2>/dev/null)
echo
echo

# Test 6: List all courses
echo "6. List All Courses:"
curl -s "$API_URL/api/courses/" \
  -H "Authorization: Bearer $STUDENT_TOKEN" | python3 -m json.tool
echo
echo

# Test 7: Student enrolls in course
echo "7. Student Enrolls in CS137:"
curl -s -X POST "$API_URL/api/courses/$COURSE_ID/enroll" \
  -H "Authorization: Bearer $STUDENT_TOKEN" | python3 -m json.tool
echo
echo

echo "=== All tests completed! ==="
echo "Server is running at: $API_URL"
echo "API docs available at: $API_URL/docs"
